import React from "react";
import TableHelper from "../../uxHelpers/TableHelper";

const SunTable = (props) => {
  return (
    <article className={`tile is-child notification ${props.successColor}`}>
      <TableHelper
        divClassName={"box center"}
        tableClassName={"table has-text-centered"}
      >
        <tbody>
          <tr>
            <td>First Light</td>
            <td>{props.astronomicalDawn}</td>
          </tr>
          <tr>
            <td>Last Light</td>
            <td>{props.astronomicalDusk}</td>
          </tr>
          <tr>
            <td>Civil Dawn</td>
            <td>{props.civilDawn}</td>
          </tr>
          <tr>
            <td>Civil Dusk</td>
            <td>{props.civilDusk}</td>
          </tr>
          <tr>
            <td>Sunset</td>
            <td>{props.sunset}</td>
          </tr>
          <tr>
            <td>Sunrise</td>
            <td>{props.sunrise}</td>
          </tr>
        </tbody>
      </TableHelper>
    </article>
  );
};

export default SunTable;
