import React from 'react';
import { Link } from 'react-router-dom';

const ShowTile = ({ record }) => {
	// debugger
	const success_color = (success) => {
		let success_color;
		if (success === 'Good') {
			success_color = `is-success`;
		} else if (success === 'Bad') {
			success_color = `is-light`;
		}
		return success_color;
	};

	return (
		<div className="tile is-ancestor m-md">
			<div className="tile is-vertical m-md is-fullwidth">
				<div className="tile">
					<div className="tile is is-parent">
						<article
							className={`tile title is-child notification is-fullwidth ${success_color(record.success)} has-text-dark`}
						>
							<div className="box desktop-m-t-md is-fullwidth">
								<p className="has-text-centered center">{record.name}</p>
							</div>
						</article>
						<div className="tile is-white is-2 is-child is-vcentered is-centered p-sm">
							<div className="desktop-m-sm p-md">
								<Link to="/records/react" className="button is-fullwidth is-dark p-sm is-medium">
									Return to list
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> 
  )
}
 
export default ShowTile;
