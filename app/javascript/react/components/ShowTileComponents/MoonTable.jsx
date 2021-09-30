import React from "react";
import TableHelper from "../../uxHelpers/TableHelper";

const MoonTable = (props) => {
  return (
    <article className={`tile is-child notification ${props.successColor}`}>
      <TableHelper
        divClassName="box center"
        tableClassName="table has-text-centered"
      >
        <tbody>
          <tr>
            <td>Moon Fraction</td>
            <td>{props.moonFraction}</td>
          </tr>
          <tr>
            <td>Moon Phase</td>
            <td>{props.moonPhase}</td>
          </tr>
          <tr>
            <td>Moonrise</td>
            <td>{props.moonrise}</td>
          </tr>
          <tr>
            <td>Moonset</td>
            <td>{props.moonset}</td>
          </tr>
        </tbody>
      </TableHelper>
    </article>
  );
};
export default MoonTable;
