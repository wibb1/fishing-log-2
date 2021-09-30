const postRecord = (record) => {
  return (
    fetch('/api/v1/records', {
      credentials: "same-origin",
      method: "POST",
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(record)
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

export default postRecord