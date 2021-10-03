const postRecord = async (record) => {
  try {
    const response = await fetch("/api/v1/records", {
      credentials: "same-origin",
      method: "POST",
      headers: {
        "Content-type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify(record),
    });
    if (!response.ok) {
    
      const errorMessage = `${response.status} (${response.statusText})`;
      throw new Error(errorMessage);
    }return response.json();
  } catch (error) {
    console.error(`Error in fetch: ${error}`);
  }
};

export default postRecord;
