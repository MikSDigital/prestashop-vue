export default function(event) {
  console.log(event.target.dataset.searchControllerUrl)
// $.post(searchURL, {
//   s: query.term,
//   resultsPerPage: 30
// }, null, 'json').then(function (resp) {
//   response(resp.products)
// }).fail(response)
}
