import React from "react";

const BodyArticle = (props) => {
  return (
    <article
      className={`tile is-child center notification ${props.successColor}`}
    >
      <div className="box is-fullheight center">
        <h1>{props.body}</h1>
      </div>
    </article>
  );
};

export default BodyArticle;
