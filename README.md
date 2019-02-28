# README

## System overview

### Url validation

For the incoming url validation - `URI::regexp` is used. Its rather permissive
and might not fullfill all strict requirements of RFC 1738.

But as shortener is going to be used as a corporate tool
(so even some weird intranet urls might be submitted) -
it might be the optimal solution.

### Short url uniqueness

Currently every submitted incoming url is getting unique short url (uuid).
It allows better statistics tracking.
E.g. same original url gets two short urls, that are shared by different ways:
corporate newsletter and slack. And user can rate which was more effective by inspecting specs of each one.

Current uuid generation mechanizm allows `16**5=1048576` unique urls to be
served, can be tuned if required.


### Access to statistics

As currently there is no auth implemented for the system,
concept of secret key access is used - allowing both private (for owner) and
public (if secret is shared) access to url visits stats.

With short link user gets a secret link, which can be used for getting access to statistics.

### Visit statistics

Stats include some basic information for the url visit (including datetime, requester ip & user agent).
These base values can be used in future to allow more
detailed/topic stats presentation (timelines, geoip filtering, etc.).


## Tech stuff & further improvements
Current design is more focused to bring kind of a usable product in a short
term. I've tried to deliver rather smooth end user experience, making it a
greater priority than performance tweaks & preliminary optimizations for architecture
 scaling.

Further improvements could be done after requirements clarifications and might include:

* checking url accessibility on creation
* async stats recording (as speed improvement)
* DRYing and improving specs suite
* using decorators for visits presentation in csv/html views
* adding auth layer

