import React from "react";
import TableHelper from "../../uxHelpers/TableHelper";

const SeaData = (props) => {
  return (
    <article className={`tile is-child notification ${props.successColor}`}>
      <TableHelper
        divClassName="box center"
        tableClassName="table has-text-centered"
      >
        <tbody>
          <tr>
            <td>Sea Level</td>
            <td>{props.seaLevel}</td>
          </tr>
          <tr>
            <td>Current Direction</td>
            <td>{props.currentDirection}</td>
          </tr>
          <tr>
            <td>Current Speed</td>
            <td>{props.currentSpeed}</td>
          </tr>
        </tbody>
      </TableHelper>
    </article>
  );
};

export default SeaData;
