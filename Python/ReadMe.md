### spacy docker 
#### load spacy model
```dockerfile
FROM python:3-onbuild
RUN python -m spacy download en_core_web_sm
CMD  ["python3", "TextAnalyzerLaunch.py"]
```
