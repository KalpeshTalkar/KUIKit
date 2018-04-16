#!/bin/bash
echo "Pushing framework to Cocoapods..."
# Switch to the KUIKit framework directory.
cd /Users/kalpeshtalkar/Documents/Projects/iOS/KUIKit
# Run lint on pod spec to validate.
pod trunk push KUIKit.podspec
echo "Validation completed."