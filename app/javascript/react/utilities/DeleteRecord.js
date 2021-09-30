
const deleteRecord = (id, payload) => {
  return (
    fetch(`/api/v1/Records/${id}`, {
      credentials: "same-origin",
      method: "DELETE",
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(payload)
    })
    .then(response => {
      if (response.ok) {
        return true
      } else {
        let errorMessage = `${response.status} (${response.statusText})`
        throw(new Error(errorMessage))
      }
    })
    .catch(error => console.error(`Error in fetch: ${error}`))
  )
}

export default deleteRecord