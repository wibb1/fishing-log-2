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
    return <option key={option.id} id={option.id} value={(option.name)}>{capitalize(option.name)}</option> ;
  });
};

export default Options;
