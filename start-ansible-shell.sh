#!/bin/bash
docker run -it --rm -v $(pwd):/etc/ansible:ro -v ~/.azure:/azure:ro hsldevcom/azure-ansible /bin/bash
