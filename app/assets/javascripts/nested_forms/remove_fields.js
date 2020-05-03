// from https://stevepolito.design/blog/create-a-nested-form-in-rails-from-scratch/

(function () {
  document.addEventListener("turbolinks:load", function(event) {
    document.addEventListener('click', e => {
      if (e.target && e.target.className == 'removeNestedFields') {
        removeNestedFields(e.target, e)
      }
    })
  });
}());

function removeNestedFields(link, e) {
  e.preventDefault()

  const fieldParent = link.closest('.basketSubscription-nestedFields')

  const deleteField = fieldParent
    ? fieldParent.querySelector('input[type="hidden"]')
    : null

  if (deleteField) {
    deleteField.value = 1
    fieldParent.style.display = 'none'
  }
}
