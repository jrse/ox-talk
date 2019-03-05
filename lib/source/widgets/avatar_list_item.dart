/*
 * OPEN-XCHANGE legal information
 *
 * All intellectual property rights in the Software are protected by
 * international copyright laws.
 *
 *
 * In some countries OX, OX Open-Xchange and open xchange
 * as well as the corresponding Logos OX Open-Xchange and OX are registered
 * trademarks of the OX Software GmbH group of companies.
 * The use of the Logos is not covered by the Mozilla Public License 2.0 (MPL 2.0).
 * Instead, you are allowed to use these Logos according to the terms and
 * conditions of the Creative Commons License, Version 2.5, Attribution,
 * Non-commercial, ShareAlike, and the interpretation of the term
 * Non-commercial applicable to the aforementioned license is published
 * on the web site https://www.open-xchange.com/terms-and-conditions/.
 *
 * Please make sure that third-party modules and libraries are used
 * according to their respective licenses.
 *
 * Any modifications to this package must retain all copyright notices
 * of the original copyright holder(s) for the original code used.
 *
 * After any such modifications, the original and derivative code shall remain
 * under the copyright of the copyright holder(s) and/or original author(s) as stated here:
 * https://www.open-xchange.com/legal/. The contributing author shall be
 * given Attribution for the derivative code and a license granting use.
 *
 * Copyright (C) 2016-2020 OX Software GmbH
 * Mail: info@open-xchange.com
 *
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the Mozilla Public License 2.0
 * for more details.
 */

import 'package:flutter/material.dart';
import 'package:ox_talk/source/widgets/avatar.dart';
import 'package:ox_talk/source/utils/dimensions.dart';

class AvatarListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  final Color color;
  final Function onTap;
  final Widget titleIcon;
  final Widget subTitleIcon;
  final IconData avatarIcon;

  AvatarListItem(
      {@required this.title, @required this.subTitle, @required this.onTap, this.avatarIcon, this.imagePath, this.color, this.titleIcon, this.subTitleIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(title, subTitle),
      child: Container(
        padding: const EdgeInsets.only(top: listItemPaddingSmall),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            avatarIcon == null ? Avatar(
              imagePath: imagePath,
              initials: getInitials(),
              color: color,
            ) :  CircleAvatar(
              radius: 24,
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey,
              child: Icon(avatarIcon),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: listItemPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: titleIcon != null ? titleIcon : Container(),
                        ),
                        Expanded(child: getTitle()),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      vertical: listItemPaddingSmall,
                    )),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: subTitleIcon != null ? subTitleIcon : Container(),
                        ),
                        Expanded(child: getSubTitle()),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  StatelessWidget getTitle() {
    return title != null
        ? Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
          )
        : Container();
  }

  StatelessWidget getSubTitle() {
    return subTitle != null
        ? Text(
            subTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black45),
          )
        : Container();
  }

  String getInitials() {
    if (title != null && title.isNotEmpty) {
      return title.substring(0, 1);
    }
    if (subTitle != null && subTitle.isNotEmpty) {
      return subTitle.substring(0, 1);
    }
    return "";
  }

}