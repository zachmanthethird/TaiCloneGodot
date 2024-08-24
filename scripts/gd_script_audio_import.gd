class_name AudioLoader

## Loads audio files at runtime.
##
## [code]iLevel 1[/code]
## [codeblock]
## GDScriptAudioImport v0.1
##
## MIT License
##
## Copyright (c) 2020 Gianclgar (Giannino Clemente) gianclgar@gmail.com
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
##
## I honestly don't care that much, Kopimi ftw, but it's my little baby and I want it to look nice :3
## [/codeblock]
## @tutorial(Source commit): https://github.com/Gianclgar/GDScriptAudioImport/blob/d5f6370d2d9f5c02b05aea03181b6241a048bf62/GDScriptAudioImport.gd
## @tutorial(_report_errors): https://docs.godotengine.org/en/4.2/classes/class_@globalscope.html#enum-globalscope-error


## Loads an audio file during runtime.
## [br][param file_path] The absolute path to the audio file.
## [br][param return] The playable stream of the audio file. Returns null on failure.
static func load_file(file_path: String) -> AudioStream:
	if file_path.begins_with("res://"):
		return load(file_path) as AudioStream

	match file_path.to_lower().get_extension():
		"wav":
			return _load_wav_file(file_path)

		"ogg":
			return AudioStreamOggVorbis.load_from_file(file_path)

		"mp3":
			var bytes := FileAccess.get_file_as_bytes(file_path)
			if bytes.is_empty():
				_report_errors(file_path)
				return

			var new_stream := AudioStreamMP3.new()
			new_stream.data = bytes
			return new_stream

	push_error("Wrong filetype or format")
	return


## Converts .wav data from 24 or 32 bits to 16.
## [br][param data] The original data from the .wav audio file.
## [br][param from] The bits per sample of the original data.
## [br][param return] The converted data into 16 bits per sample.
## [codeblock]
## These conversions are SLOW in GDScript
## on my one test song, 32 -> 16 was around 3x slower than 24 -> 16
##
## I couldn't get threads to help very much
## They made the 24bit case about 2x faster in my test file
## And the 32bit case abour 50% slower
## I don't wanna risk it always being slower on other files
## And really, the solution would be to handle it in a low-level language
##
## 24 bit .wav's are typically stored as integers
## so we just grab the 2 most significant bytes and ignore the other
##
## 32 bit .wav's are typically stored as floating point numbers
## so we need to grab all 4 bytes and interpret them as a float first
## [/codeblock]
## TODO: This method should use [FileAccess] methods directly instead of operating on the resulting [PackedByteArray].
## @experimental
static func _convert_to_16bit(data: PackedByteArray, from: int) -> PackedByteArray:
	print("converting to 16-bit from %d" % from)
	var time := Time.get_ticks_msec()
	match from:
		24:
			var j := 0
			for i in range(0, data.size(), 3):
				data[j] = data[i+1]
				data[j+1] = data[i+2]
				j += 2

			var _resize := data.resize(int(data.size() * 2.0 / 3))

		32:
			var spb := StreamPeerBuffer.new()
			var single_float := 0.0
			var value := 0
			for i in range(0, data.size(), 4):
				spb.data_array = data.slice(i, i + 4)
				single_float = spb.get_float()
				value = int(single_float * 32768)
				data[i / 2.0] = value
				data[i / 2.0 + 1] = value >> 8

			var _resize := data.resize(int(data.size() / 2.0))

	print("Took %f seconds for slow conversion" % ((Time.get_ticks_msec() - time) / 1000.0))
	return data


## Loads a .wav audio file during runtime.
## [br][param file_path] The absolute path to the .wav audio file.
## [br][param return] The playable stream of the .wav audio file.
## [codeblock]
## ---------- REFERENCE ---------------
## note: typical values doesn't always match
##
## Positions  Typical Value  Description
##
##  1 -  4    "RIFF"         Marks the file as a RIFF multimedia file.
##                           Characters are each 1 byte long.
##
##  5 -  8    (integer)      The overall file size in bytes (32-bit integer)
##                           minus 8 bytes. Typically, you'd fill this in after
##                           file creation is complete.
##
##  9 - 12    "WAVE"         RIFF file format header. For our purposes, it
##                           always equals "WAVE".
##
## 13 - 16    "fmt "         Format sub-chunk marker. Includes trailing null.
##
## 17 - 20    16             Length of the rest of the format sub-chunk below.
##
## 21 - 22    1              Audio format code, a 2 byte (16 bit) integer.
##                           1 = PCM (pulse code modulation).
##
## 23 - 24    2              Number of channels as a 2 byte (16 bit) integer.
##                           1 = mono, 2 = stereo, etc.
##
## 25 - 28    44100          Sample rate as a 4 byte (32 bit) integer. Common
##                           values are 44100 (CD), 48000 (DAT). Sample rate =
##                           number of samples per second, or Hertz.
##
## 29 - 32    176400         (SampleRate * BitsPerSample * Channels) / 8
##                           This is the Byte rate.
##
## 33 - 34    4              (BitsPerSample * Channels) / 8
##                           1 = 8 bit mono, 2 = 8 bit stereo or 16 bit mono, 4
##                           = 16 bit stereo.
##
## 35 - 36    16             Bits per sample.
##
## 37 - 40    "data"         Data sub-chunk header. Marks the beginning of the
##                           raw data section.
##
## 41 - 44    (integer)      The number of bytes of the data section below this
##                           point. Also equal to (#ofSamples * #ofChannels *
##                           BitsPerSample) / 8
##
## 45+                       The raw audio data.
## [/codeblock]
## ZMTT TODO: This function fails on a significant minority of files tested.
## This decoding method is fundamentally flawed and needs to be completely rewritten.
## @experimental
static func _load_wav_file(file_path: String) -> AudioStreamWAV:
	var new_stream := AudioStreamWAV.new()
	var file := FileAccess.open(file_path, FileAccess.READ)
	if file == null:
		_report_errors(file_path)
		return new_stream

	var bits_per_sample := 0
	var length := file.get_length()
	while true:
		if file.get_position() >= length - 4:
			print("Data byte not found")
			break

		match file.get_buffer(4).get_string_from_ascii():
			"RIFF":
				print("RIFF OK at bytes ", file.get_position() - 4, "-", file.get_position() - 1)

			"WAVE":
				print("WAVE OK at bytes ", file.get_position() - 4, "-", file.get_position() - 1)

			"fmt ":
				print("fmt OK at bytes ", file.get_position() - 4, "-", file.get_position() - 1)
				print("Format subchunk size: ", file.get_32())
				var format_code := file.get_16()
				var format_name := ""
				match format_code:
					0:
						format_name = "8_BITS"

					1:
						format_name = "16_BITS"

					2:
						format_name = "IMA_ADPCM"

					_:
						format_name = "UNKNOWN (trying to interpret as 16_BITS)"
						format_code = 1

				print("Format: ", format_code, " ", format_name)
				new_stream.set_format(format_code)
				var channel_num := file.get_16()
				print("Number of channels: ", channel_num)
				new_stream.stereo = channel_num == 2
				var sample_rate := file.get_32()
				print("Sample rate: ", sample_rate)
				new_stream.mix_rate = sample_rate
				print("Byte rate: ", file.get_32())
				print("BitsPerSample * Channel / 8: ", file.get_16())
				bits_per_sample = file.get_16()
				print("Bits per sample: ", bits_per_sample)

			"data":
				if bits_per_sample == 0:
					push_error()

				var audio_data_size := file.get_32()
				print("Audio data/stream size is ", audio_data_size, " bytes")
				print("Audio data starts at byte ", file.get_position())
				var data := file.get_buffer(audio_data_size)
				if bits_per_sample in [24, 32]:
					new_stream.data = _convert_to_16bit(data, bits_per_sample)

				else:
					new_stream.data = data

				break

			_:
				file.seek(file.get_position() - 3)

	file.close()
	new_stream.loop_end = int(new_stream.data.size() / 4.0)
	return new_stream


## Reports any errors when attempting to [method FileAccess.open].
## [br][param file_path] The absolute path to the file.
static func _report_errors(file_path: String) -> void:
	var err := FileAccess.get_open_error()
	var result_hash := ""
	match err:
		ERR_FILE_NOT_FOUND:
			result_hash = "File: not found"

		ERR_FILE_BAD_DRIVE:
			result_hash = "File: Bad drive error"

		ERR_FILE_BAD_PATH:
			result_hash = "File: Bad path error."

		ERR_FILE_NO_PERMISSION:
			result_hash = "File: No permission error."

		ERR_FILE_ALREADY_IN_USE:
			result_hash = "File: Already in use error."

		ERR_FILE_CANT_OPEN:
			result_hash = "File: Can't open error."

		ERR_FILE_CANT_WRITE:
			result_hash = "File: Can't write error."

		ERR_FILE_CANT_READ:
			result_hash = "File: Can't read error."

		ERR_FILE_UNRECOGNIZED:
			result_hash = "File: Unrecognized error."

		ERR_FILE_CORRUPT:
			result_hash = "File: Corrupt error."

		ERR_FILE_MISSING_DEPENDENCIES:
			result_hash = "File: Missing dependencies error."

		ERR_FILE_EOF:
			result_hash = "File: End of file (EOF) error."

		_:
			push_error("Unknown error with file ", file_path, " error code: ", err)
			return

	push_error(result_hash, " ", file_path)
