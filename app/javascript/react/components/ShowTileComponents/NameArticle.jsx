import React from "react";

const NameArticle = (props) => {
  return (
    <article
      className={`tile title is-child notification is-fullwidth ${props.successColor} has-text-dark`}
    >
      <div className="box desktop-m-t-md is-fullwidth">
        <p className="has-text-centered center">{props.name}</p>
      </div>
    </article>
  );
};

export default NameArticle;
