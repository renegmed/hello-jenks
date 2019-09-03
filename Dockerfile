# use a node base image
# The image
#  1. copy all files in the current directory to /usr/src/app inside the image
#  2. run npm install to install any dependencies for app (ifwe had any)
#  3. specify npm start as the command Docker runs when the container starts
#
FROM node:7-onbuild

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
