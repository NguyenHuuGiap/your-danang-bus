function changeAvatarFileEvent(input) {
    $('.avatar').attr('src', URL.createObjectURL(input.files[0]));
}

