import React from "react";

const FigureArticle = (props) => {
  return (
    <article
    className={`tile is-child notification ${props.successColor} center`}
  >
    <figure className="image is-fullwidth">
      <img src={`${props.image}`}></img>
    </figure>
  </article>
  )
}

export default FigureArticle
