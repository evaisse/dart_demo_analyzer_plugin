#!/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd $SCRIPT_DIR
dart pub get
cd $SCRIPT_DIR/example/demo_analyzed_project
dart pub get
cd $SCRIPT_DIR/tools/analyzer_plugin
dart pub get