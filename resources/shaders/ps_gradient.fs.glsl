/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

void main(void) {
#ifdef WR_FEATURE_TRANSFORM
    float alpha = 0;
    vec2 local_pos = init_transform_fs(vLocalPos, vLocalRect, alpha);
#else
    vec2 local_pos = vPos;
#endif

    do_clip(local_pos, vClipRect, vClipRadius);

    oFragColor = mix(vColor0, vColor1, vF);

#ifdef WR_FEATURE_TRANSFORM
    oFragColor.a *= alpha;
#endif
}