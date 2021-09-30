import React from "react";
import TableHelper from "../../uxHelpers/TableHelper";

const MoonSunSummary = (props) => {
  return (
    <div className="column is-centered">
      <TableHelper divClassName={"box center"}
        tableClassName={"table has-text-centered center"}>
          <tbody>
            <tr>
              <th>Moon/Sun Info</th>
              <th>Value</th>
            </tr>
            <tr>
              <td>Moon Fraction</td>
              <td>{props.moonFraction}</td>
            </tr>
            <tr>
              <td>Moon Phase</td>
              <td>{props.moonPhase}</td>
            </tr>
            <tr>
              <td>Sunrise</td>
              <td>{props.sunrise}</td>
            </tr>
            <tr>
              <td>Sunset</td>
              <td>{props.sunset}</td>
            </tr>
          </tbody>
        </TableHelper>
    </div>
  );
};

export default MoonSunSummary;
