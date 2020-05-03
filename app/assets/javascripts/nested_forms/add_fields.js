// from https://stevepolito.design/blog/create-a-nested-form-in-rails-from-scratch/

(function () {
  document.addEventListener("turbolinks:load", function(event) {
    const addNestedFieldsLinks = document.querySelectorAll('.addNestedFields')

    iterateLinks(addNestedFieldsLinks)
  });
}());


function iterateLinks(links) {
  if (links.length === 0) return

  links.forEach(link => {
    link.addEventListener('click', e => {
      addNestedFields(link, e)
    })
  })
}

function addNestedFields(link, e) {
  e.preventDefault()

  const time = new Date().getTime()
  const linkId = link.dataset.id
  const regexp = linkId ? new RegExp(linkId, 'g') : null
  const newFields = regexp ? link.dataset.fields.replace(regexp, time) : null

  newFields ? link.insertAdjacentHTML('beforebegin', newFields) : null
}

