This script takes two arguments on execution - a url and file extension (with or without the dot).  
**Example: file_downloader.sh example.com pdf**  
It does not recursively search web pages. It greps though the webpage's html for the extension specified and the results are piped through to sed. Sed searches for strings enclosed in quotations on that line. With luck this will catch links to the file type specified. This method is messy and easily broken, but it's faster than downloading a bunch of pdfs via point-and-click.
---
**Requirements**: parallel (sudo apt-get install parallel)