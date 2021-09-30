import React from "react";
import TableHelper from "../../uxHelpers/TableHelper";
import WeatherData from "./WeatherData";

const WaveData = (props) => {
  return (
    <article className={`tile is-child notification ${props.successColor}`}>
      <TableHelper
        divClassName="box center"
        tableClassName="table has-text-centered"
      >
        <tbody>
          <tr>
            <td>Wave Direction</td>
            <td>{props.waveDirection}</td>
          </tr>
          <tr>
            <td>Wave Height</td>
            <td>{props.waveHeight}</td>
          </tr>
          <tr>
            <td>Wave Period</td>
            <td>{props.wavePeriod}</td>
          </tr>
        </tbody>
      </TableHelper>
    </article>
  );
};

export default WaveData;
