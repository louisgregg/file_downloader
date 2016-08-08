**Update:** This script has been changed to rely entirely on wget - it no longer curls and parses html to find links to files of the desired type. Much more reliable this way :-)


This script takes two or more arguments on execution - a url and file extension(s) (WITHOUT the preceding dot).  
**Example: bash file_downloader.sh example.com pdf jpg doc**  


Wget then searches recursively through web pages using for files with the extension(s) specified and downloads them to the current folder. The websites folder trees are not preserved. 
