#! /bin/sh
# Require a valid Git ref as an argument
if [ "$#" -ne 1 ] || ! git rev-parse --verify "$1" >/dev/null; then
    echo "Usage: $0 GIT_REF" >&2
    exit 1
fi

# Go through the list of files that have changed in the last commit
commit_sha=$1
for f in $(git diff --name-only "${commit_sha}" "${commit_sha}~1");
do
    # Get the changed file name, path, and containing folder name
    cfile=$(basename "${f}")
    cpath=$(dirname "${f}")
    cdir=$(basename "${cpath}")

    # If the file changed was a Dockerfile, build it and push the result
    if [ "$cfile" = "Dockerfile" ]; then
        echo "Building updated Dockerfile: $f"
        cd "${cpath}" || continue
        docker build . --tag "helics/buildenv:${cdir}"
        docker push "helics/buildenv:${cdir}"
        cd - || continue
    fi
done
