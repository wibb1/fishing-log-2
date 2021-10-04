import getURL from "./GetURL";

const getData = async (dataType, id="") => {
  try {
    const response = await fetch(getURL(dataType, id));
    if (!response.ok) {
      const errorMessage = `${response.status} (${response.statusText})`;
      throw new Error(errorMessage);
    }
    return response.json();
  } catch (error) {
    console.error(`Error in fetch: ${error}`);
  }
};

export default getData;
