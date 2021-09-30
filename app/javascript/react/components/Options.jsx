import React from "react";
import ToTitleCase from "../utilities/ToTitleCase";

const Options = (props) => {
    return props.options.map((option)=>{
      return <option key={option} value={ToTitleCase(option)} label={option}/>
    })
};

export default Options