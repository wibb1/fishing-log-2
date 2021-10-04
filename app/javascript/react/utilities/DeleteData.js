import getURL from "./GetURL";

const deleteData = async (dataType, id, payload) => {

  try {
    const response = await fetch(getURL(), {
      credentials: "same-origin",
      method: "DELETE",
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
  } catch (error) {
    console.error(`Error in fetch: ${error}`);
  }
};

export default deleteData;
