#ExTBatchFile

Batch update file name on Mac OS X

You can rename a lot of file on a folder with some format.

## Build

You can download the source to build it with yourself!

### Requirement

* Mac OS X 10.10 +
* Xcode 6.1

### Compile

1. Open the `ExTBatchFile.xcodeproj`
2. Xcode Menu → Product → Run
3. Finish! The application will in `Product` Folder!

## File name format

You can format files with those tag

Index: `{id}`

Batch date: `{bdate}`

Batch time: `{btime}`

Original File name: `{fname}`

Original Extension: `{exte}`

**Example**
File: sample.txt

- `{id}.{exte}` → 1.txt
- `awesome_{id}.{exte}` → awesome_1.txt
- `{fname}_{id}.{exte}` → sample_1.txt
- `{bdate}.md` → 20141129.md
- `{btime}.md` → 00-00-00.md


## Developmant

Project Developer : OnikurChan (TsnYikHei)

- - -
ExTBatchFile is open source

Available under the GNU General Public License v3.