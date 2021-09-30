import React from "react";

const TableHelper = (props) => {
  return (
    <div className={`${props.divClassName}`}>
      <table className={props.tableClassName}>{props.children}</table>
    </div>
  );
};

export default TableHelper;
