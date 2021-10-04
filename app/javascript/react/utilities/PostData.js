import getURL from "./GetURL";

const postData = async (dataType, formPayload) => {
  try {
    const response = await fetch(getURL(dataType), {
      credentials: "same-origin",
      method: "POST",
      headers: {
        "Content-type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify(formPayload),
    });
    if (!response.ok) {
      const errorMessage = `${response.status} (${response.statusText})`;
      throw new Error(errorMessage);
    }
    return await response.json();
  } catch (error) {
    console.error(`Error in fetch: ${error}`);
  }
};

export default postData;
