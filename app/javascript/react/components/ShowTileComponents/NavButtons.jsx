import React from "react";
import { Link } from "react-router-dom";

const NavButtons = (props) => {
  return (
    <div className="tile is-white is-2 is-child is-vcentered is-centered p-sm">
      <div className="desktop-m-sm p-md">
        <Link
          to="/records/react"
          className="button is-fullwidth is-dark p-sm is-medium"
        >
          Return to list
        </Link>
      </div>
      <div className="desktop-m-sm p-md">
        <a
          href={`/records/${props.id}/edit`}
          className="button is-fullwidth is-dark is-medium"
        >
          Edit Spot
        </a>
      </div>
    </div>
  );
};

export default NavButtons;
