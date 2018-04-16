#!/bin/bash
echo "Validating framework..."
# Switch to the KUIKit framework directory.
cd /Users/kalpeshtalkar/Documents/Projects/iOS/KUIKit
# Run lint on pod spec to validate.
pod spec lint KUIKit.podspec --verbose
echo "Validation completed."