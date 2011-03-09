#ifndef _COMMON_H_
#define _COMMON_H_

struct sqlca;

/**
 * Connect to the database.
 * @return the error code.
 */
int connect();

/**
 * Disconnect from the database.
 * @return the error code.
 */
int disconnect();

/**
 * Gets the current SQLCODE.
 * @return the current SQLCODE.
 */
int sqlcode();

/**
 * Print a publication by its id.
 * Note that the id must be at most 10 characters long.
 * @param id the id of the publication to write.
 * @return the error code:
 *         - 0 on success
 *         - -1 if the id more than 10 characters long.
 *         - >0 on error
 */
int print(const char *id);

#endif