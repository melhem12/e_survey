# simple_ocr_plugin_example

Demonstrates how to use the simple_ocr_plugin plugin.

## usage

The following code snippet is all you need to perform OCR on an image / photo:
```
try {
   String _resultString = await SimpleOcrPlugin.performOCR(_pickedImageFile.path);
   print("OCR results => $_resultString");

} catch(e) {
   print("exception on OCR operation: ${e.toString()}");
}
```
