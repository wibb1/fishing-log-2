const getRecords = () => {
  return fetch('api/v1/records')
    .then((response) => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`;
        throw new Error(errorMessage);
      }
    })
    .then(response => response.json())
    .catch(error => {
      console.error(`Error in Fetch: ${error.message}`);
    });
};

export default getRecords;
