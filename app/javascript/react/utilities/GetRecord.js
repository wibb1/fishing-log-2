const getRecord = async (id) => {
  try{
    const response = await fetch(`/api/v1/records/${id}`)
    if (!response.ok) {
      const errorMessage = `${response.status} (${response.statusText})`;
      throw(new Error(errorMessage));
    }
    return response.json()
  } catch(error){
    console.error(`Error in fetch: ${error}`);
  }
};

export default getRecord;
