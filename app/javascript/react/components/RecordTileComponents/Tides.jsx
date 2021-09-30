import React from "react";
import TableHelper from "../../uxHelpers/TableHelper";

const Tides = (props) => {
  return (
    <div className="column m-2">
      <TableHelper
        divClassName={"box center"}
        tableClassName={"table has-text-centered center"}
      >
        <tbody>
          <tr>
            <th>Tide</th>
            <th>Time</th>
            <th>aMSL</th>
          </tr>
          <tr>
            <td>{props.first_type}</td>
            <td>{props.first_time}</td>
            <td>{props.first_height} </td>
          </tr>
          <tr>
            <td>{props.second_type}</td>
            <td>{props.second_time}</td>
            <td>{props.second_height}</td>
          </tr>
          <tr>
            <td>{props.third_type}</td>
            <td>{props.third_time}</td>
            <td>{props.third_height}</td>
          </tr>
          <tr>
            <td>{props.fourth_type}</td>
            <td>{props.fourth_time}</td>
            <td>{props.fourth_height}</td>
          </tr>
        </tbody>
      </TableHelper>
    </div>
  );
};

export default Tides;
