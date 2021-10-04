import React, {useState} from "react";
import ToTitleCase from "../utilities/ToTitleCase";

const Options = (props) => {
  const capitalize = (option) => {
    if (props.capitalize) {
      return ToTitleCase(option);
    } else {
      return option;
    }
  };
  return props.options.map((option) => {
    return <option key={option.id} value={capitalize(option.name)}>{option.name}</option> ;
  });
};

export default Options;
