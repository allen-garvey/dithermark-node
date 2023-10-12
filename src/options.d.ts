/* eslint-disable */
/**
 * This file was automatically generated by json-schema-to-typescript.
 * DO NOT MODIFY IT BY HAND. Instead, modify the source JSONSchema file,
 * and run json-schema-to-typescript to regenerate this file.
 */

/**
 * This document records options that can be passed to Dithermark-node
 */
export interface DithermarkNodeOptions {
  /**
   * Image filtering properties
   */
  image?: {
    /**
     * Filters that are run before the image is dithered.
     */
    preDither?: {
      /**
       * Amount. 0 means no change.
       */
      pixelate?: number;
      /**
       * Number as percent. 100 means no change.
       */
      brightness?: number;
      /**
       * Number as percent. 100 means no change.
       */
      contrast?: number;
      /**
       * Amount. 0 means no change.
       */
      smooth?: number;
    };
  };
}
