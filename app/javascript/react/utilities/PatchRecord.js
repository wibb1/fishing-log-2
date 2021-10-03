const patchRecord = async (id, payload) => {
  try {
    const response = await fetch(`/api/v1/records/${id}`, {
      credentials: "same-origin",
      method: "PATCH",
      headers: {
        "Content-type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify(payload),
    });
    if (!response.ok) {
      const errorMessage = `${response.status} (${response.statusText})`;
      throw new Error(errorMessage);
    }
    return response.json();
  } catch (error) {
    console.error(`Error in fetch: ${error}`);
  }
};

export default patchRecord;
