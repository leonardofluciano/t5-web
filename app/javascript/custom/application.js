import Inputmask from "inputmask"

Inputmask.extendDefaults({
    removeMaskOnSubmit: true,
})

document.addEventListener("turbolinks:load", function() {
    Inputmask().mask(document.querySelectorAll('input'))
})