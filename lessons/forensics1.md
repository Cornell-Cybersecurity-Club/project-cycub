---
layout: base
---

# Forensics 1

Drafted with Claude, prompted and edited by humans

## Introduction

Forensics challenges in Capture The Flag (CTF) competitions test your ability to discover hidden information within files, systems, or data. These challenges simulate real-world digital forensics scenarios where investigators must recover evidence from digital artifacts. This guide covers the fundamental concepts and tools you'll need to tackle forensics challenges.
Key Forensics Areas

## Encodings

Encodings are methods of representing data in different formats:

- **Binary**: Raw 1s and 0s representation. A single binary character is a bit and eight are bytes. Refer to standard metric prefixes for larger sizes (ie. kilobyte indicates 1,000 bytes… or 1,024).
- **Base64**: Common encoding that converts binary data to ASCII text. It often ends with equals signs = but not always.
- **Hexadecimal**: Represents binary data using the characters 0-9 and A-F. It is common to do file analysis with hex editors because hexadecimal is a convenient way to represent binary data—a byte can be represented with only two hex characters.
- **ASCII/ANSI/Unicode**: Character encoding standards. When you open a file in Notepad, you are seeing the data interpreted with the ANSI encoding. ASCII and ANSI cover the standard characters and operations you see on your keyboard (a-z, A-Z, 0-9, !, [backspace], etc.) while Unicode is an extension for other languages.
- **URL Encoding**: Converts special characters for use in URLs

It is important to note that encoding is not the same thing as encrypting. The purpose of encryption is to make the data unreadable to outsiders while encoding is just another way to format the data.

When approaching an encoding challenge, identify the encoding type first, then use the appropriate tool to decode it. To identify the encoding method, consider what characters are being used and note if the data seems to be random or somehow structured. Multiple layers of encoding are common.

Try playing with [CyberChef](https://cyberchef.org/) which makes converting between encodings easy.

## File Formats

You’ve probably heard of file types: PDF, JPG, PNG, DOCX, etc. All of these formats specify how programs should be formatted for programs to interpret—ie. a JPG file is meant to be read as a picture, not a document.

A file extension, the last part of a filename, can technically be set to anything. For example, the file hello.png has the extension .png . However, I could rename the file to hello.docx and then Microsoft Word may try to open the file. Of course, it would not work since it would be reading the data wrong.

Files can contain hidden data or be disguised as different types:

- **File signatures/magic bytes**: First few bytes that identify a file type
- **File extension manipulation**: Files with incorrect extensions
- **File carving**: Extracting files from within other files
- **Corrupted files**: Intentionally damaged files that need repair

Always check if a file's actual type matches its extension using tools like the file command which will check the magic bytes for the file format. You can use hex editors to reveal a file's true structure. A common Linux hex editor is xxd, though online ones are often more featureful.

## Metadata

Metadata is "data about data" and can contain hidden information:

EXIF data: Found in images, including camera details, GPS coordinates, timestamps
Document properties: Author, creation date, revisions in documents
File system metadata: Creation, modification, access times

Creators often hide flags in metadata fields that aren't immediately visible when viewing a file.
Steganography
Steganography is the practice of hiding data within other data:

Image steganography: Hiding data in image pixels, often in least significant bits
Audio steganography: Concealing data in audio files, sometimes audible only in spectrograms
Text steganography: Using invisible characters, specific letter patterns, or whitespace

Stego challenges may require password extraction from other parts of the challenge. For years, I have referred to 0xRick’s list of steganography tools for common steg-solving programs. Aperisolve is another tool which will automate many steganography and analysis operations.
Disk Image and Memory Forensics
These challenges involve analyzing captured system states:

Disk images: Complete copies of storage devices containing file systems, deleted files. They can be analyzed with tools like Autopsy.
Memory dumps: Snapshots of system RAM, containing running processes, passwords in cleartext. An appropriate tool for memory dumps is Volatility.
Registry analysis: Windows registry keys and values that may contain important information
Log analysis: System and application logs that record events

These challenges most closely resemble professional digital forensics work. We will not be going in depth on disk image forensics and memory forensics, though it can be fun to learn.

Often, the challenges will consist of looking through dumps for files, programs, and running processes containing cool information.

## Tools

CyberChef - Quickly convert encodings
0xRick Steganography - List of steganography commands
Aperisolve - Automate several basic steganography tasks
Autopsy - Analyze disk images
Volatility - Analyze memory dumps
HexEd.it - Online hex editor

## General Approach to Forensics Challenges

1. Identify the challenge type: Determine what kind of forensics challenge you're facing.
2. Examine the file properties: Check file type, size, and metadata.
3. Use appropriate tools: Select tools based on challenge type.
4. Think creatively: CTF creators often use misdirection; look beyond the obvious.
5. Document your process: Track what you've tried to avoid repetition.

Remember, forensics challenges often combine multiple concepts. The best approach is methodical analysis using appropriate tools while documenting your steps.

## Optional Readings

CTF Handbook - Forensics
