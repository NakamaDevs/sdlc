# SOURCE SNAPSHOT\n\n- Source URL: https://docs.ollama.com/macos\n- Title: Ollama for macOS\n- Retrieved: 2026-08-27\n- Conversion: Turndown 7.2.4\n- Status: archival copy; verify the live source for current facts.\n\n---\n\n> ## Documentation Index
> 
> Fetch the complete documentation index at: [/llms.txt](/llms.txt)
> 
> Use this file to discover all available pages before exploring further.

[Skip to main content](#content-area)

[Ollama home page![light logo](https://mintcdn.com/ollama-9269c548/XefrxzvUktkk84RL/images/logo.png?fit=max&auto=format&n=XefrxzvUktkk84RL&q=85&s=03a38b5749aa7f530044e9b251dc10d8)![dark logo](https://mintcdn.com/ollama-9269c548/XefrxzvUktkk84RL/images/logo-dark.png?fit=max&auto=format&n=XefrxzvUktkk84RL&q=85&s=c214b467f5623414c31d4e05c66110fb)](https://ollama.com)

Search...

⌘K

### Get started

*   [
    
    Welcome
    
    
    
    ](/)
*   [
    
    Quickstart
    
    
    
    ](/quickstart)
*   [
    
    Cloud
    
    
    
    ](/cloud)

### Capabilities

*   [
    
    Streaming
    
    
    
    ](/capabilities/streaming)
*   [
    
    Thinking
    
    
    
    ](/capabilities/thinking)
*   [
    
    Structured Outputs
    
    
    
    ](/capabilities/structured-outputs)
*   [
    
    Vision
    
    
    
    ](/capabilities/vision)
*   [
    
    Embeddings
    
    
    
    ](/capabilities/embeddings)
*   [
    
    Tool calling
    
    
    
    ](/capabilities/tool-calling)
*   [
    
    Web search
    
    
    
    ](/capabilities/web-search)

### More information

*   [
    
    CLI Reference
    
    
    
    ](/cli)
*   [
    
    Modelfile Reference
    
    
    
    ](/modelfile)
*   [
    
    Context length
    
    
    
    ](/context-length)
*   [
    
    Linux
    
    
    
    ](/linux)
*   [
    
    macOS
    
    
    
    ](/macos)
*   [
    
    Windows
    
    
    
    ](/windows)
*   [
    
    Docker
    
    
    
    ](/docker)
*   [
    
    Importing a Model
    
    
    
    ](/import)
*   [
    
    FAQ
    
    
    
    ](/faq)
*   [
    
    Hardware support
    
    
    
    ](/gpu)
*   [
    
    Troubleshooting
    
    
    
    ](/troubleshooting)

*   [
    
    Sign in
    
    ](https://ollama.com/signin)
*   [
    
    Download
    
    ](https://ollama.com/download)

[Ollama home page![light logo](https://mintcdn.com/ollama-9269c548/XefrxzvUktkk84RL/images/logo.png?fit=max&auto=format&n=XefrxzvUktkk84RL&q=85&s=03a38b5749aa7f530044e9b251dc10d8)![dark logo](https://mintcdn.com/ollama-9269c548/XefrxzvUktkk84RL/images/logo-dark.png?fit=max&auto=format&n=XefrxzvUktkk84RL&q=85&s=c214b467f5623414c31d4e05c66110fb)](https://ollama.com)

Search...

⌘K

*   [Sign in](https://ollama.com/signin)
*   [Download](https://ollama.com/download)
*   [
    
    Download
    
    ](https://ollama.com/download)

Search...

Navigation

More information

macOS

[Guide

](/)[Integrations

](/integrations)[API Reference

](/api/introduction)

[Guide

](/)[Integrations

](/integrations)[API Reference

](/api/introduction)

More information

# macOS

Copy pageCopy page

Copy pageCopy page

## 

[​

](#system-requirements)

System Requirements

*   MacOS Sonoma (v14) or newer
*   Apple M series (CPU and GPU support) or x86 (CPU only)

## 

[​

](#filesystem-requirements)

Filesystem Requirements

The preferred method of installation is to mount the `ollama.dmg` and drag-and-drop the Ollama application to the system-wide `Applications` folder. Upon startup, the Ollama app will verify the `ollama` CLI is present in your PATH, and if not detected, will prompt for permission to create a link in `/usr/local/bin` Once you’ve installed Ollama, you’ll need additional space for storing the Large Language models, which can be tens to hundreds of GB in size. If your home directory doesn’t have enough space, you can change where the binaries are installed, and where the models are stored.

### 

[​

](#changing-install-location)

Changing Install Location

To install the Ollama application somewhere other than `Applications`, place the Ollama application in the desired location, and ensure the CLI `Ollama.app/Contents/Resources/ollama` or a sym-link to the CLI can be found in your path. Upon first start decline the “Move to Applications?” request.

## 

[​

](#troubleshooting)

Troubleshooting

Ollama on MacOS stores files in a few different locations.

*   `~/.ollama` contains models and configuration
*   `~/.ollama/logs` contains logs
    *   _app.log_ contains most recent logs from the GUI application
    *   _server.log_ contains the most recent server logs
*   `<install location>/Ollama.app/Contents/Resources/ollama` the CLI binary

## 

[​

](#uninstall)

Uninstall

To fully remove Ollama from your system, remove the following files and folders:

```
sudo rm -rf /Applications/Ollama.app
sudo rm /usr/local/bin/ollama
rm -rf "~/Library/Application Support/Ollama"
rm -rf "~/Library/Saved Application State/com.electron.ollama.savedState"
rm -rf ~/Library/Caches/com.electron.ollama/
rm -rf ~/Library/Caches/ollama
rm -rf ~/Library/WebKit/com.electron.ollama
rm -rf ~/.ollama
```

[Previous](/linux)[

Windows

Next



](/windows)

⌘I

## On this page

*   [System Requirements](#system-requirements)
*   [Filesystem Requirements](#filesystem-requirements)
    *   [Changing Install Location](#changing-install-location)
*   [Troubleshooting](#troubleshooting)
*   [Uninstall](#uninstall)