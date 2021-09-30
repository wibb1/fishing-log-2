import React from "react";

const RecordInfo = (props) => {
  return (
    <article
      className={`tile is-child notification ${props.success_color} has-text-centered`}
    >
      <div className="box">
        <p>{props.date}</p>
      </div>
      <div className="box center">
        <table className="table has-text-centered">
          <tbody>
            <tr>
              <td>Species</td>
              <td>{props.common_name}</td>
              <td></td>
            </tr>
            <tr>
              <td>Latitude</td>
              <td>{props.latitude}</td>
              <td>N</td>
            </tr>
            <tr>
              <td>Longitude</td>
              <td>{props.longitude}</td>
              <td>E</td>
            </tr>
          </tbody>
        </table>
      </div>
    </article>
  );
};

export default RecordInfo;
