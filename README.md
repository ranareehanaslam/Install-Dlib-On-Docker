# Installing dlib on Google Cloud Run using Docker

This guide will walk you through the steps to deploy a Python application with dlib dependencies on Google Cloud Run using a Docker container.

## Installation

To set up the necessary environment and dependencies for this application, follow these steps:


### Step 1: Upgrade pip and setuptools

```bash
RUN pip install --upgrade pip setuptools
```

### Step 2: Install CMake 
```bash
RUN pip install cmake
```

CMake is a crucial tool for building software projects. In this step, we install a CMake using pip.

### Step 3: Install System Dependencies

```bash
RUN apt-get clean && apt-get -y update && apt-get install -y build-essential cmake libopenblas-dev liblapack-dev libopenblas-dev liblapack-dev
```

This command cleans the package cache, updates the package lists, and installs essential system dependencies including build-essential, cmake, libopenblas-dev, and liblapack-dev. These dependencies are required for building certain Python packages like dlib.

### Step 4: Install dlib

```bash
RUN pip install dlib
```


dlib is a library that provides machine learning algorithms and tools for computer vision applications. We install dlibusing pip.

That's it! You have successfully installed the necessary dependencies for the Face Forgery Detection Web Application.
