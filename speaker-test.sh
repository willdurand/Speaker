#!/usr/bin/env roundup
#
# speaker-test.sh | William Durand

describe "speaker"

speaker="./speaker"
input_file="dummy-post-title.markdown"
mp3_file="dummy-post-title.mp3"
output_dir="output_directory"
new_output_dir="new_output_directory"

before() {
    echo "dummy content in my awesome post" > $input_file
    mkdir $output_dir
}

after() {
    rm -rf $input_file $mp3_file
    rm -rf $output_dir $new_output_dir
}

it_shows_help_with_no_argv() {
    $speaker | grep USAGE
}

it_shows_help_with_h_option() {
    $speaker -h | grep USAGE
}

it_creates_mp3_file() {
    $speaker $input_file

    test -f $mp3_file
}

it_creates_mp3_file_in_existing_directory() {
    $speaker -d $output_dir $input_file

    test -f "$output_dir/$mp3_file" && test ! -f $mp3_file
}

it_creates_mp3_file_in_new_directory() {
    $speaker -d $new_output_dir $input_file

    test -f "$new_output_dir/$mp3_file" && test ! -f $mp3_file
}
