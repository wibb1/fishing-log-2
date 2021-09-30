const patchRecord = (id, payload) => {
  return (
    fetch(`/api/v1/Records/${id}`, {
      credentials: "same-origin",
      method: "PATCH",
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(payload)
    })
    .then(response => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`
        throw(new Error(errorMessage))
      }
    })
    .then(response => response.json())
    .catch(error => console.error(`Error in fetch: ${error}`))
  )
}

export default patchRecord