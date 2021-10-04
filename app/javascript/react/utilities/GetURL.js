const getURL = (dataType, id = "") => {
  switch (dataType) {
    case "records":
      return "/api/v1/records";
    case "record":
      return `/api/v1/records/${id}`;
    case "one_species":
      return `/api/v1/species/${id}`;
    case "all_species":
      return `/api/v1/species`;
    default:
      return "Error in dataType";
  }
};

export default getURL;
