import Inputmask from "inputmask"

Inputmask.extendDefaults({
    removeMaskOnSubmit: true,
})

document.addEventListener("turbolinks:load", function() {
    Inputmask().mask(document.querySelectorAll('input'))
        
    let allowedCrudNames = [ 'companies', 'subsidiaries', 'customers', 'accounts' ] 
    let crudNamesRegex   = new RegExp(`^\/(${allowedCrudNames.join('|')})($|\/.*)`)
    let crudName         = window.location.pathname.replace(crudNamesRegex, '$1')
    
    if (allowedCrudNames.includes(crudName)) {
        $('.web-nav-link').removeClass('text-primary')
        $('.web-nav-link').addClass('text-secondary')

        let elemString = `#web-nav-link-${crudName}`
        $(elemString).removeClass('text-secondary')
        $(elemString).addClass('text-primary')
    }
})